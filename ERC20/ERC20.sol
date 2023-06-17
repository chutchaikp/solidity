// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// no safemath need
// var name start with _ is private var

interface IERC20 {
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);

    function transfer(address _to, uint256 _value) external returns (bool success);
    function approve(address _spender, uint256 _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
    function balanceOf(address _owner) external view returns (uint256 balance);

    // function totalSupply() external view returns (uint256);

}

// abstract - เป็นนามธรรม ไม่สามารถสร้างเป็นตัวตนได้ ไม่สามารถสร้างเป็น object ได้
// abstract - ไม่พร้อมใช้ ต้องเอาไป implement ต่อ
// abstract - ตั้งใช้ใช้เป็นแม่ของคนอื่นอีก
// abstract - extend หรือ inherit ได้อีก
// abstract - ตั้งใจไม่ให้คนเอา ERC20 ไปใช้โดยตรง แต่จะให้ extend หรือ inherit ต่อไป


abstract contract ERC20 is IERC20 {
    // _ is private
    // state - global - similar save to database !
    string _name;
    string _symbol;    
    uint _totalSupply; // uint256 = uint
    
    mapping(address => uint) _balances; // owner => balance
    mapping(address => mapping(address => uint)) _allowances; // owner => (spender => amount)

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function name() public override view returns (string memory) {
        return _name;
    }

    function symbol() public override view returns (string memory) {
        return _symbol;
    }

    function decimals() public override  pure returns (uint8) {
        return 0;
    }

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public override view returns (uint256 balance) {
        return _balances[_owner];
    }

    // transfer from me to _to
    function transfer(address _to, uint256 _value) public override returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _amount) public override returns (bool success) {
        _approve(msg.sender, _spender, _amount);
        return true;
    }

    function allowance(address _owner, address _spender) public override  view returns (uint256 remaining) {
        return _allowances[_owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _value) public override  returns (bool success) {
        if (_from != msg.sender) {
            uint allowanceAmount = _allowances[_from][msg.sender];
            require(_value <= allowanceAmount, "Transfer amount exceeds allowance");
            _approve(_from, msg.sender, allowanceAmount - _value);
        }

        _transfer(_from, _to, _value);
        return true;
    }



    // === Private Function ===

    // private ลูกมองไม่เห็น (ต้องเป็น internal)
    // internal ส่งต่อให้ลูกได้
    // การเขียน smart contract ซิมเปิ้ลสุดๆ ไม่มีอะไรยุ่งยาก ไม่ต้อง query database ให้ยุ่งยาก
    // insert/update/delete อะไรให้ยุ่งยาก 
    // คุณใช้ mapping ในการเก็บดาต้า อย่างนี้เป็นหลักเลย
    // แล้วค่านี้ถูกบันทึกลง blockchain
    // mapping datatype ใช้กันบ่อยมาก

    function _transfer(address from, address to, uint amount) internal {
        require(from != address(0), "Transfer from zero address"); // error messgae will be seen on client side (solidity similar write api)
        require(to != address(0), "Transfer to zero address");
        require(amount <= _balances[from], "Transfer amount exceeds balance");


        _balances[from] -= amount;
        _balances[to] += amount;

        // ทุกครั้งที่มีการ transfer คุณต้องบอกให้โลกรู้ว่ามีการ transfer เกิดขึ้น
        emit Transfer(from, to, amount);
    }

    // spender - ตัวแทนของเรา
    // เรา อนุญาติ ให้คนอื่นจัดการเงินของเรา ได้เท่าไร
    // เหมือน เรขา ช่วยจัดการเงินให้เรา

    function _approve(address _owner, address _spender, uint _amount) internal {
        require(_owner != address(0), "Approve from zero address");
        require(_spender != address(0), "Approve from zero address");

        _allowances[_owner][_spender] = _amount;

        // Raise event to the world
        emit Approval(_owner, _spender, _amount);
    } 

    // *** เสกเหรียญ มาจากอากาศ ***
    function _mint(address to, uint amount) internal  {
        require(to != address(0), "Mint to zero address");

        _balances[to] += amount;

        // เหรียญของเราน่าเชื่อถือ ต้อง
        _totalSupply += amount; // ตรวจสอบได้

        emit Transfer(address(0), to, amount);
    }

    // *** ทำลายเหรียญทิ้ง ***
    function _burn(address from, uint amount) internal {
        require(from != address(0), "Burn from zero address");
        require(amount <= _balances[from], "Burn amount exceeds balance");

        _balances[from] -= amount;
        _totalSupply -= amount;

        emit Transfer(from, address(0), amount);
    }

}

contract INFC is ERC20 {

    constructor() ERC20("INF Coin", "INFC") {

    }

    function deposit() public payable {
        require(msg.value > 0, "Amount is zero" );

        _mint(msg.sender, msg.value);
    }

    function withdraw(uint amount ) public  {
        require(amount > 0 && amount <= _balances[msg.sender], "Withdraw amount exceeds balance");
        

        payable(msg.sender).transfer(amount);
        _burn(msg.sender, amount);
    }
}
