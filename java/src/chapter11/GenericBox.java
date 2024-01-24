package chapter11;

public class GenericBox<T> {
	
								// new GenericBox<Student>();

	private T t;   				// private Student t;
	
	public void set(T t) {   	// public void set(Student t) { 
		this.t = t;
	}
	
	public T get() {			// public Student get() {
		return t;
	}
}
