// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Estudiante{

    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping (string => uint) private _notasmaterias;
    string [] private materias;

    constructor(string memory nombre_, string memory apellido_, string memory curso_){

        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }

    function apellido() public view returns(string memory){

        return _apellido;
    }

     function nombre_completo() public view returns(string memory){

        return string.concat(_nombre, " ", _apellido);
     }

    function curso() public view returns(string memory){

        return _curso;
    }

    function set_nota_materia(uint nota, string memory materia) public{

        require(msg.sender == _docente, "Solo el docente puede asignar notas");
        if (_notasmaterias[materia] == 0)
        {
            materias.push(materia);
        }
        _notasmaterias[materia] = nota;
    }

    function nota_materia(string memory materia) public view returns (uint){

        return _notasmaterias[materia];
    }
    function aprobo(string memory materia) public view returns (bool){

        if (_notasmaterias[materia] >= 60)
        {
            return true;
        }
        return false;
    }
    function promedio() public view returns (uint){

       uint _promedio = 0;
       for (uint i = 0; i<materias.length; i++)
       {
           _promedio += _notasmaterias[materias[i]];
       }
       return _promedio/materias.length;
    }

}