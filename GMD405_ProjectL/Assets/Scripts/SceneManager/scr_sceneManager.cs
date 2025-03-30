using UnityEngine;
using UnityEngine.SceneManagement;

public class scr_sceneManager : MonoBehaviour
{
    public static scr_sceneManager instance { get; private set; }
    private void Awake()
    {
        //DontDestroyOnLoad(this.gameObject);
        if (instance == null)
        {
            instance = this;
        }
        else
        {
            Destroy(this);
        }
    }

    public void ChangeScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName);
    }

    public void LoadGameScene()
    {
        if (scr_dataPersistenceManager.instance.playerData.SceneName != null)
        {
            SceneManager.LoadScene(scr_dataPersistenceManager.instance.playerData.SceneName);
        }
        else
        {
            ChangeScene("sce_dialogue");
        }
    }
}
