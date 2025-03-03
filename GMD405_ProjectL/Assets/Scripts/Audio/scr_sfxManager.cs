using UnityEngine;

public class scr_sfxManager : MonoBehaviour
{
    public static scr_sfxManager instance { get; private set; }
    AudioSource sfxSource;
    public AudioClip sfxClip;

    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
        else
        {
            Destroy(this);
        }
    }

    private void Start()
    {
        sfxSource = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void PlaySFX(AudioClip audio)
    {
        sfxSource.clip = audio;
        sfxSource.Play();
    }
}
