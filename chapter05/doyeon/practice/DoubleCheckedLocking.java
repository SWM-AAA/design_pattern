// p. 216
package chapter05.doyeon.practice;
// DCL방식

// 장점: 아직 인스턴스가 없던, 처음에만 동기화 함수가 발동되어서 , 성능을 조금 덜 낮춘다.
// 단점: 자바 5 이상에서만 쓸수있다. 속도 중요하지 않으면 필요없다.
// 자바 1.4 이전에선 못쓴다.
public class DoubleCheckedLocking {
    // volatile 키워드를 사용하면 uniqueInstance 변수에 대한 원자적 조작을 보장한다.
    private volatile static DoubleCheckedLocking uniqueInstance;

    private DoubleCheckedLocking() {
    }

    public static DoubleCheckedLocking getInstance() {
        if (uniqueInstance == null) {
            synchronized (DoubleCheckedLocking.class) { // 인스턴스가 없을 때만 동기화 블록에 들어감
                if (uniqueInstance == null) { // 한번더 null을 체크한다.
                    uniqueInstance = new DoubleCheckedLocking();
                }
            }

        }
        return uniqueInstance;
    }

}
