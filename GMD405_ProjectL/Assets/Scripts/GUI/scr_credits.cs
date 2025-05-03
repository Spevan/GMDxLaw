using UnityEngine;
using UnityEngine.SceneManagement;

public class scr_credits : MonoBehaviour
{
    public float timeElapsed;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        timeElapsed = 5;
    }

    // Update is called once per frame
    void Update()
    {
        if (timeElapsed > 0)
        {
            timeElapsed -= Time.deltaTime;
        }
        else if(transform.position.y >= 1000)
        {
            SceneManager.LoadScene("sce_mainMenu");
        }
        else
        {
            transform.Translate(new Vector3(0, 0.25f, 0));
        } 
    }
}
