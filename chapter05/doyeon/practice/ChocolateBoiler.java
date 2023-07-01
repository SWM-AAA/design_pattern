// 210쪽, 213쪽 예제
package chapter05.doyeon.practice;

public class ChocolateBoiler {
    private boolean empty;
    private boolean boiled;
    private static ChocolateBoiler uniqueInstance;

    private ChocolateBoiler() {
    }

    // 2개 이상 스레드에서 아래 getInstance를 동시에 접근하는것을 막기위해 synchronized를 사용한다.
    // 단점: 메소드를 동기화하면 성능이 100배정도 저하된다.
    public static synchronized ChocolateBoiler getInstance() {
        if (uniqueInstance == null) { // 여기서 멀티스레드시 문제가 발생할것같다.
            uniqueInstance = new ChocolateBoiler();
        }
        return uniqueInstance;
    }
    // 기타 메소드들
}