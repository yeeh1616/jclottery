/**
 * <p>Desc:Hashtable实现，方便键值对数据存取</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/2/20 Version 1.0
 */
 
function Hashtable()
{
	/** 使用空对象，将key作为对象的一个属性 */
	this._hash = {};	
	
	/** 统计hash表的长度 */
	this._size = 0;	
	
	/** 使用数组存储Key */
	this._keySet = new Array();
	
	/** 存储value */
	this._valueSet = new Array();
	
	/** 清除Hashtable,置空,从此映射中移除所有映射关系 */
	this.clear = function() { 
		this._hash = {}; 
		this._size = 0; 
		this._keySet = new Array();
		this._valueSet = new Array();
	}
	
	/** 判断Hashtable表是否包含key */
	this.containsKey = function( key ) { 
		return this._hash.hasOwnProperty(key); 
	}
	
	/** 如果此映射将一个或多个键映射到指定值，则返回 true */
	this.containsValue = function ( value ) {
		for ( var i = 0; i < this._valueSet.length; i++ ) {
			if ( this._valueSet[i] == value )
				return true;
		}
		return false;
	}
	
	/** 返回此映射中包含的映射关系的 Set 视图，在js中返回Array数组 */
	this.entrySet = function() {
		return this._keySet;
	}
	/** 返回此映射的哈希码值。映射的哈希码定义为此映射 entrySet() 视图中每个项的哈希码之和 */
	this.hashCode = function() {
	
	}
	/** 如果此映射未包含键-值映射关系，则返回 true */
	this.isEmpty = function() {
		if ( this._size == 0 ) 
			return true;
		return false;
	}
	
	/** 将指定的值与此映射中的指定键关联。如果此映射以前包含一个该键的映射关系，则用指定值替换旧值 */
	/**	参数：
	  * 	key - 与指定值关联的键
	  *		value - 与指定键关联的值
    */
	this.put = function( key, value ) {
		/**if (this._hash.hasOwnProperty(key)) 
			return false;
		else { */
		/** 当key存在时，执行覆盖操作 */
		this._hash[key] = value; 
		this._size++;
		
		this._keySet.push( key );
		this._valueSet.push( value );
		return true; 
		//}
	}
	
	/** 如果存在一个键的映射关系，则将其从此映射中移除 */
	this.remove = function( key ) { 
		if (this._hash.hasOwnProperty(key)) {
			delete this._hash[key]; 
			this._keySet = this._keySet.del(this._keySet.indexOf(key));
			this._valueSet = this._valueSet.del(this._valueSet.indexOf(key));
			this._size--;
		}
	}
	
	/** 获取Hash长度,返回此映射中的键-值映射关系数 */
	this.size = function() { 
		return this._size; 
	}
	
	/** 返回指定键所映射的值；如果此映射不包含该键的映射关系，则返回 undefined */
	this.get = function( key ) { 
		if (this.containsKey( key )) 
			return this._hash[key]; 
		return 'undefined';
	}	
	
	
	
	
}

/** 取得数组下标 */
Array.prototype.indexOf = function( value ) {
	for ( i = 0; i < this.length; i++ ) {
		if ( this[i] == value ) {
			return i;
		}
	}
	return -1;
}
 /** 按下标移除数组元素 */
Array.prototype.del = function( n ) {  
  if( n < 0 )  /** 如果n<0，则不进行任何操作。 */
    return this;
  else
    return this.slice(0,n).concat(this.slice(n+1,this.length));   
}

/** 根据下标删除 */
Array.prototype.deleteElementByIndex = function ( index ) {
	return this.del( index );
}

/** 根据存储对象删除 */
Array.prototype.deleteElementByValue = function ( obj ) {
	return this.del( this.indexOf( obj ) );
}

String.prototype.replaceAll = function(s1, s2) {      
    return this.replace(new RegExp(s1, "gm"), s2); //g全局     
} 
