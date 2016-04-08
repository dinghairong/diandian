package com.smart4c.bean;

import com.smart4c.util.MiscUtils;

import java.util.List;

public abstract class AbstractModel<T> implements java.io.Serializable
{
	protected static final String OBJECT_NOT_YET_PERISTED="The object is not persisted yet, this operation requires the object to already be persisted.";

	public abstract T getId();

//	@Override
//    public String toString()
//	{
//		return(ReflectionToStringBuilder.toString(this));
//	}

	@Override
    public int hashCode()
	{
		if (getId() == null)
		{
			StackTraceElement[] stack = new Throwable().getStackTrace();
			for (int i = 0; i < stack.length; i++) {
		        if(stack[i].getClassName().equals("com.androidservice.android.bean")
		        		&& stack[i].getMethodName().equals("toString")) {
		        	return super.hashCode();
		        }
	        }
			MiscUtils.getLogger().warn(OBJECT_NOT_YET_PERISTED, new Exception());
			return(super.hashCode());
		}

		return(getId().hashCode());
	}

	@Override
	public boolean equals(Object o)
	{
		if (getClass()!=o.getClass()) return(false);

		@SuppressWarnings("unchecked")
		AbstractModel<T> abstractModel=(AbstractModel<T>)o;
		if (getId() == null)
		{
			MiscUtils.getLogger().warn(OBJECT_NOT_YET_PERISTED, new Exception());
		}

		return(getId().equals(abstractModel.getId()));
	}

	/**
	 * This method checks to see if there is an entry in the list with the corresponding primary key, it does not check to see that the other values are the
	 * same or not.
	 */
	public static <X extends AbstractModel<?>> boolean existsId(List<X> list, X searchModel)
	{
		Object searchPk = searchModel.getId();
		for (X tempModel : list)
		{
			Object tempPk = tempModel.getId();
			if (searchPk.equals(tempPk)) return(true);
		}

		return(false);
	}

}

